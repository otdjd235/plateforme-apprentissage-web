from app.db import get_db_connection

try:
    conn = get_db_connection()
    print("✅ Connected to the database successfully!")
    conn.close()
except Exception as e:
    print(f"❌ Database connection failed: {e}")
