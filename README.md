# Lab Azure: Arquitetura para ETL com Azure SQL Database e Azure Data Factory

Neste laboratório, implementei uma arquitetura na Azure para realizar o processo de Extract, Transform, Load (ETL) dos dados. A seguir, apresento os principais passos e componentes utilizados.

## Arquitetura

![Diagrama](https://drive.google.com/uc?id=1LmWiQz2sefBPg0wU0GciUw1AOnNJEgVt)

1. **Criação de um Banco de Dados no Azure SQL Database:**

   - Configuração do banco de dados para armazenar os dados transformados.

   ![Database Step 1](https://drive.google.com/uc?id=1m0XI8ffRTdgwRTndThjq9CHd_QrhGhnm)
   ![Database Step 2](https://drive.google.com/uc?id=1XIF2Af5WSjfgJsM3i3oTti4TLeDd4Qg2)

2. **Criação de um Contêiner no Storage Account para Armazenar os Arquivos CSV:**

   - Utilização do Storage Account para armazenar os arquivos CSV de entrada.

   ![Storage Container](https://drive.google.com/uc?id=1765VdbrK65pcq25A1sUqu6S3DMpFSGGV)

3. **Criação de Pipelines no Azure Data Factory para Orquestrar o ETL:**

   - Desenvolvimento de pipelines para coordenar o processo ETL.

   ![Data Factory Pipeline](https://drive.google.com/uc?id=1BliSg1jFoWzivo5C3rkhioycE8-JLdDi)

## Resultados

Com essa arquitetura, conseguimos realizar com sucesso o ETL dos dados dos arquivos CSV, armazenando-os no banco de dados do Azure SQL Database. Isso cria um ambiente propício para análises futuras.
