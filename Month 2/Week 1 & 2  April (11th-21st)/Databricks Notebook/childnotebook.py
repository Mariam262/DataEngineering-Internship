# Databricks notebook source
print("i am child notebook")

# COMMAND ----------

# DBTITLE 1,give some value to exit notebook
dbutils.notebook.exit(100);

# COMMAND ----------

# DBTITLE 1,I have passed default value parameter as 10
dbutils.widgets.text("input","", "send parameter value to main notebook")

# COMMAND ----------

a=dbutils.widgets.get("input")

# COMMAND ----------

print(a)
