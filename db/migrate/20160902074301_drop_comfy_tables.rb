class DropComfyTables < ActiveRecord::Migration
  def up
    drop_table :cms_fortress_roles
    drop_table :cms_fortress_role_details
    drop_table :cms_fortress_users
    drop_table :cms_page_workflows
    drop_table :comfy_cms_blocks
    drop_table :comfy_cms_categories
    drop_table :comfy_cms_categorizations
    drop_table :comfy_cms_files
    drop_table :comfy_cms_layouts
    drop_table :comfy_cms_pages
    drop_table :comfy_cms_revisions
    drop_table :comfy_cms_sites
    drop_table :comfy_cms_snippets
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
