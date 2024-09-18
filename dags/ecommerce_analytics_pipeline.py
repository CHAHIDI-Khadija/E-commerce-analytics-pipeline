from airflow.decorators import dag, task
from datetime import datetime

from airflow.providers.google.cloud.transfers.local_to_gcs import LocalFilesystemToGCSOperator
from airflow.providers.google.cloud.operators.bigquery import BigQueryCreateEmptyDatasetOperator
from airflow.contrib.operators.gcs_to_bq import GoogleCloudStorageToBigQueryOperator

from cosmos.airflow.task_group import DbtTaskGroup
from include.dbt.cosmos_config import DBT_PROJECT_CONFIG, DBT_CONFIG
from cosmos.constants import LoadMode
from cosmos.config import ProjectConfig, RenderConfig

from airflow.models.baseoperator import chain

# List of files and corresponding table names
files_to_tables = {
    'olist_customers_dataset.csv': 'customers',
    'olist_geolocation_dataset.csv': 'geolocation',
    'olist_order_items_dataset.csv': 'order_items',
    'olist_order_payments_dataset.csv': 'order_payments',
    'olist_orders_dataset.csv': 'orders',
    'olist_products_dataset.csv': 'products',
    'olist_sellers_dataset.csv': 'sellers',
    'product_category_name_translation.csv': 'category_translation'
}


@dag(
    start_date=datetime(2024, 8, 23),
    schedule=None,
    catchup=False,
    tags=["ecommerce_analytics"],
)
def ecommerce_analytics():
    upload_csv_to_gcs = LocalFilesystemToGCSOperator(
        task_id="upload_csv_to_gcs",
        src="/usr/local/airflow/include/dataset/*.csv",
        dst="raw/",
        bucket = 'brazilian-ecommerce',
        gcp_conn_id = 'gcp',
        mime_type= 'text/csv',

    )

    create_ecommerce_dataset = BigQueryCreateEmptyDatasetOperator(
        task_id = 'create_ecommerce_dataset',
        dataset_id = 'ecommerce_analytics',
        gcp_conn_id = 'gcp',
    )

    for file_name, table_name in files_to_tables.items():
        gcs_to_bq = GoogleCloudStorageToBigQueryOperator(
            task_id=f'gcs_to_bq_{table_name}',
            bucket='brazilian-ecommerce',
            source_objects=[f'raw/{file_name}'],
            destination_project_dataset_table=f'ecommerce_analytics.{table_name}',
            write_disposition='WRITE_TRUNCATE',
            create_disposition='CREATE_IF_NEEDED',
            gcp_conn_id='gcp',
            max_bad_records=250, 
        )


    transform = DbtTaskGroup(
        group_id = 'transform',
        project_config = DBT_PROJECT_CONFIG,
        profile_config = DBT_CONFIG,
        render_config = RenderConfig(
            load_method = LoadMode.DBT_LS,
            select = ['path:models/transform']
        )
    )

    chain(
        upload_csv_to_gcs,
        create_ecommerce_dataset,
        gcs_to_bq,
        transform
    )
    

ecommerce_analytics()
