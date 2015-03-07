namespace HAMIMPART.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class product : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "Model", c => c.String());
            AddColumn("dbo.Products", "Brand", c => c.String());
            AddColumn("dbo.Products", "HardDisk", c => c.String());
            AddColumn("dbo.Products", "Ram", c => c.String());
            AddColumn("dbo.Products", "MadeBy", c => c.String());
            AddColumn("dbo.Products", "Size", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Products", "Size");
            DropColumn("dbo.Products", "MadeBy");
            DropColumn("dbo.Products", "Ram");
            DropColumn("dbo.Products", "HardDisk");
            DropColumn("dbo.Products", "Brand");
            DropColumn("dbo.Products", "Model");
        }
    }
}
