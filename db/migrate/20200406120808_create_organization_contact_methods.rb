class CreateOrganizationContactMethods < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE organization_contact_method AS ENUM ('call', 'text');
    SQL

    execute <<-DDL
      ALTER TABLE organizations
      ALTER COLUMN contact_method TYPE organization_contact_method
      USING contact_method::organization_contact_method;
    DDL
  end

  def down
    execute <<-DDL
      ALTER TABLE organizations
      ALTER COLUMN contact_method TYPE text
      USING contact_method::text;
    DDL

    execute <<-SQL
      DROP TYPE organization_contact_method;
    SQL
  end
end
