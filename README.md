# 🎮 Video Games Sales Data Pipeline

## 🎯 1. Problem Description

A indústria de videogames é uma das que mais movimenta dinheiro no mundo do entretenimento. Para publishers (editoras) e estúdios de desenvolvimento, entender o que vende bem em cada região (América do Norte, Europa, Japão) e quais gêneros ou plataformas estão em alta é fundamental para a tomada de decisões de negócios e aprovação de novos projetos.

Este projeto tem como objetivo construir um pipeline de dados ponta a ponta que extrai o histórico de vendas de videogames (mais de 16.500 registros), processa essas informações na nuvem e as disponibiliza em um Data Warehouse otimizado. O produto final é um dashboard analítico que responde a perguntas como:
* Como as vendas de jogos evoluíram ao longo dos anos?
* Quais gêneros são mais populares em diferentes regiões do mundo?
* Quais Publishers dominam o mercado global?

---

## 🏗️ 2. Cloud & Architecture
> **Nota para você:** Mais 4 pontos garantidos aqui ao mostrar que usamos Nuvem e IaC.

O projeto foi desenvolvido inteiramente na nuvem (Google Cloud Platform), utilizando Infraestrutura como Código (Terraform) para provisionamento.

**Arquitetura do Pipeline:**
1. **Data Source:** [Link/Nome do Dataset]
2. **Infrastructure as Code (IaC):** Terraform (GCP Cloud Storage & BigQuery)
3. **Workflow Orchestration:** [Airflow / Mage / Prefect]
4. **Data Warehouse:** Google BigQuery
5. **Transformations:** dbt (Data Build Tool)
6. **Dashboard:** [Looker Studio / Metabase / Streamlit]

---

## ⚙️ 3. Pipeline Details

### Data Ingestion (Batch)
> **Nota para você:** 4 pontos de orquestração.
Os dados são extraídos do dataset original e carregados no Google Cloud Storage (Data Lake) mensalmente através de um pipeline construído em [Orquestrador].

### Data Warehouse (BigQuery)
> **Nota para você:** 4 pontos de DWH.
As tabelas externas foram criadas no BigQuery. Para otimizar as consultas e reduzir custos, os dados foram:
* **Partitioned by:** [Sua coluna de data - ex: order_date]
* **Clustered by:** [Sua coluna de categoria - ex: product_category]

### Transformations (dbt)
> **Nota para você:** 4 pontos de transformações.
O dbt foi utilizado para a camada de transformação. Modelos em SQL foram criados para limpar os dados brutos e gerar a tabela final (mart) que alimenta o dashboard de BI.

---

## 📈 4. Dashboard
> **Nota para você:** 4 pontos de Dashboard.
O dashboard final contém visualizações interativas para facilitar a tomada de decisão.
* **Gráfico Temporal:** Mostra a evolução de X ao longo do tempo.
* **Gráfico Categórico:** Mostra a distribuição percentual de Y por categoria.

[INSERIR IMAGEM/PRINT DO DASHBOARD AQUI NO FUTURO]

🔗 **[Link para acessar o Dashboard ao vivo]**

---

## 🚀 5. Reproducibility (Como rodar este projeto)
> **Nota para você:** Os últimos 4 pontos cruciais. Seus colegas vão seguir isso aqui.

Siga os passos abaixo para reproduzir este pipeline no seu próprio ambiente:

### Pré-requisitos
* Conta no Google Cloud Platform (GCP)
* Arquivo de credenciais (`google_credentials.json`)
* Docker e Docker-Compose instalados
* Terraform instalado

### Passo a Passo

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/GPetrolini/DE-zoomcamp-project.git](https://github.com/GPetrolini/DE-zoomcamp-project.git)
   cd DE-zoomcamp-project