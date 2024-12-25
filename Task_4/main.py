import pandas as pd

df_1 = pd.read_excel("тз.xlsx", sheet_name="Таблица1 задача4")
df_2 = pd.read_excel("тз.xlsx", sheet_name="Таблица2 задача4")

df_3 = df_1.merge(df_2, how='left')

print(df_3.head())
