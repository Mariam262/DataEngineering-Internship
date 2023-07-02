# Databricks notebook source
# DBTITLE 1,Printing message in python
a="hello"
print(a)


# COMMAND ----------

# DBTITLE 1,Magic Commands convert python to sql
# MAGIC %sql
# MAGIC select "hello"

# COMMAND ----------

# MAGIC %scala
# MAGIC val a="hello"

# COMMAND ----------

# DBTITLE 1,File system command
# MAGIC %fs
# MAGIC ls

# COMMAND ----------

# MAGIC %fs
# MAGIC ls dbfs:/databricks-datasets/

# COMMAND ----------

# MAGIC %fs
# MAGIC   ls dbfs:/databricks-datasets/COVID/

# COMMAND ----------

# DBTITLE 1,File System Utilities =show all the folder
dbutils.fs.ls('/')

# COMMAND ----------

# DBTITLE 1,Combine python filder with dbutils
for folder_name in dbutils.fs.ls('/'):
    print (folder_name)
   

# COMMAND ----------

# DBTITLE 1,show dbutils.fs utilities
dbutils.fs.help()

# COMMAND ----------

# DBTITLE 1,Show particular util info**
dbutils.fs.help("mount")

# COMMAND ----------

# DBTITLE 1,Notebook workflow utility = chain 2 notebooks together
dbutils.notebook.help()

# COMMAND ----------

dbutils.notebook.run("./childnotebook",10, ("input": "called form main notebook"));

# COMMAND ----------

# DBTITLE 1,Widgets utility = pass parameters from 1 notebook to other
dbutils.widgets.help()

# COMMAND ----------



# COMMAND ----------


