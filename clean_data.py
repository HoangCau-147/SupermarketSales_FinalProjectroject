import pandas as pd
from datetime import datetime

# Đọc dữ liệu từ file Excel
xl_file = pd.ExcelFile('supermarket_sales.xls')
df = xl_file.parse('supermarket_sales')  # Chọn sheet 'supermarket_sales'

# Clean cột "Gender"
df['Gender'] = df['Gender'].apply(lambda x: 'Female' if x in ['F', 'Female'] else 'Male' if x in ['M', 'Male'] else x)

# Clean cột "Date"
def parse_date(x):
    try:
        return datetime.strptime(str(x), '%Y-%m-%d %H:%M:%S').strftime('%d/%m/%Y')
    except ValueError:
        return datetime.strptime(str(x), '%d-%b-%y').strftime('%d/%m/%Y')

df['Date'] = df['Date'].apply(parse_date)

# Chia cột "Date" thành các cột "Day", "Month", "Year"
df['Day'] = pd.to_datetime(df['Date'], format='%d/%m/%Y').dt.day
df['Month'] = pd.to_datetime(df['Date'], format='%d/%m/%Y').dt.month
df['Year'] = pd.to_datetime(df['Date'], format='%d/%m/%Y').dt.year

# Sắp xếp lại các cột theo thứ tự mong muốn
desired_order = [
    'Invoice ID', 'Branch', 'Customer type', 'Gender', 'ProductID', 'Quantity', 'Tax 5%', 'Total',
    'Day', 'Month', 'Year', 'Time', 'Payment', 'cogs', 'gross margin percentage',
    'gross income', 'Rating'
]

df = df[desired_order]

# Lưu dữ liệu đã làm sạch và giữ lại các sheet khác
with pd.ExcelWriter('SupermarketSales_Cleaned.xlsx') as writer:
    df.to_excel(writer, index=False, sheet_name='supermarket_sales')  # Lưu sheet 'supermarket_sales'
    for sheet_name in xl_file.sheet_names:
        if sheet_name != 'supermarket_sales':
            sheet_data = xl_file.parse(sheet_name)
            sheet_data.to_excel(writer, index=False, sheet_name=sheet_name)
