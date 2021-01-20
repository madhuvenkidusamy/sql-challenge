import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, inspect
import pandas as pd


# Connect to postgres
engine = create_engine("postgres://madhuvenkidusamy:blend62@localhost:5432/employees")


# Load CSVs into Beekeeper. ONLY DO THIS ONCE!! DO NOT KEEP REPLACING TABLES IN BEEKEEPER.
tables = ['departments','dept_emp','dept_manager','employees','salaries','titles']
for table in tables:
    path = '/Users/madhuvenkidusamy/Documents/Data Science Bootcamp/Homeworks/sql-challenge/EmployeeSQL/' +table+ '.csv'
    with open(path, 'r') as file:
        data_df = pd.read_csv(file)
    data_df.to_sql(table, con=engine, index=True, index_label='id', if_exists='replace')

# Verify all tables have been loaded to postgres
print(inspect(engine).get_table_names())

