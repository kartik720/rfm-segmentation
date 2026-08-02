import os
from urllib.parse import quote_plus

import pandas as pd

from sqlalchemy import create_engine
from dotenv import load_dotenv

load_dotenv()
password = quote_plus(os.getenv('DB_PASSWORD'))
engine = create_engine(f'mysql+pymysql://root:{password}@localhost/olist')

df = pd.read_csv(
    '/Volumes/T7 Shield/Work 2nd/Projects/rfm-segmentation/csv_files_kaggle/olist_customers_dataset.csv')
df.to_sql('customers', engine, if_exists='replace', index=False)

df = pd.read_csv(
    '/Volumes/T7 Shield/Work 2nd/Projects/rfm-segmentation/csv_files_kaggle/olist_geolocation_dataset.csv')
df.to_sql('geolocation', engine, if_exists='replace', index=False)

df = pd.read_csv(
    '/Volumes/T7 Shield/Work 2nd/Projects/rfm-segmentation/csv_files_kaggle/olist_order_items_dataset.csv')
df.to_sql('order_items', engine, if_exists='replace', index=False)

df = pd.read_csv(
    '/Volumes/T7 Shield/Work 2nd/Projects/rfm-segmentation/csv_files_kaggle/olist_order_payments_dataset.csv')
df.to_sql('order_payments', engine, if_exists='replace', index=False)

df = pd.read_csv(
    '/Volumes/T7 Shield/Work 2nd/Projects/rfm-segmentation/csv_files_kaggle/olist_order_reviews_dataset.csv')
df.to_sql('order_reviews', engine, if_exists='replace', index=False)

df = pd.read_csv(
    '/Volumes/T7 Shield/Work 2nd/Projects/rfm-segmentation/csv_files_kaggle/olist_orders_dataset.csv')
df.to_sql('orders', engine, if_exists='replace', index=False)

df = pd.read_csv(
    '/Volumes/T7 Shield/Work 2nd/Projects/rfm-segmentation/csv_files_kaggle/olist_products_dataset.csv')
df.to_sql('products', engine, if_exists='replace', index=False)

df = pd.read_csv(
    '/Volumes/T7 Shield/Work 2nd/Projects/rfm-segmentation/csv_files_kaggle/olist_sellers_dataset.csv')
df.to_sql('sellers', engine, if_exists='replace', index=False)

df = pd.read_csv(
    '/Volumes/T7 Shield/Work 2nd/Projects/rfm-segmentation/csv_files_kaggle/product_category_name_translation.csv')
df.to_sql('product_category_name_translation',
          engine, if_exists='replace', index=False)
