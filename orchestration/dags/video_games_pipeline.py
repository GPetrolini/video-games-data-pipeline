import os
from airflow import DAG
from airflow.decorators import task
import pendulum

KAGGLE_DATASET = "gregorut/videogamesales"
DATA_DIR = "/opt/airflow/data"

default_args = {
    "owner": "gustavo",
    "start_date": pendulum.datetime(2026, 3, 1, tz="America/Sao_Paulo"),
    "retries": 1,
}

with DAG(
    dag_id="video_games_sales_pipeline",
    default_args=default_args,
    schedule_interval=None,
    catchup=False,
    tags=["zoocamps", "kaggle", "gcp"],
    doc_md="""
    ### Video Games Sales Pipeline
    DAG responsável por extrair dados do Kaggle e (em breve) subir para o Data Lake no GCP.
    """
) as dag:

    @task(task_id="download_dataset_kaggle")
    def download_kaggle_data():
        import kaggle

        os.makedirs(DATA_DIR, exist_ok=True)
        print(f"Iniciando download do dataset: {KAGGLE_DATASET}")

        kaggle.api.authenticate()

        kaggle.api.dataset_download_files(
            dataset=KAGGLE_DATASET,
            path=DATA_DIR,
            unzip=True
        )

        file_path = os.path.join(DATA_DIR, "vgsales.csv")
        print(f"Download concluido com sucesso! Arquivo salvo em: {file_path}")

        return file_path

    download_task = download_kaggle_data()