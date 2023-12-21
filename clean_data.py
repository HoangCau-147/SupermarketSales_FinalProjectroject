import pandas as pd
from datetime import datetime

# Đọc dữ liệu từ file Excel
xl_file = pd.ExcelFile('supermarket_sales.xls')
df = xl_file.parse('supermarket_sales')  # Chọn sheet 'SupermarketSales'

# Clean cột "Gender"
df['Gender'] = df['Gender'].apply(lambda x: 'Female' if x in ['F', 'Female'] else 'Male' if x in ['M', 'Male'] else x)

# Clean cột "Date"
def parse_date(x):
    try:
        return datetime.strptime(str(x), '%Y-%m-%d %H:%M:%S').strftime('%d/%m/%Y')
    except ValueError:
        return datetime.strptime(str(x), '%d-%b-%y').strftime('%d/%m/%Y')

df['Date'] = df['Date'].apply(parse_date)

# Lưu dữ liệu đã làm sạch và giữ lại các sheet khác
with pd.ExcelWriter('SupermarketSales_Cleaned.xlsx') as writer:
    df.to_excel(writer, index=False, sheet_name='supermarket_sales')  # Lưu sheet 'SupermarketSales'
    for sheet_name in xl_file.sheet_names:
        if sheet_name != 'supermarket_sales':
            sheet_data = xl_file.parse(sheet_name)
            sheet_data.to_excel(writer, index=False, sheet_name=sheet_name)
