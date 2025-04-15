export $(grep -v '^#' .env | xargs)

echo "Applying migrations to database: $DB_NAME..."

for file in database/*.sql; do
    echo "Executing $file..."
    mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < $file
done

echo "All migrations applied!"