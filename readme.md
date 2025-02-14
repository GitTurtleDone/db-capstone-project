setting up repsitory for project

Copyright to @Thai Giang Dang 14 February 2025 GitTurtleDone.github

- The treatment of the MenuItems table in the course was not correct. The MenuItems table should be an intermediate between two tables Menus and Items. Menus and Items are connected by a many-to-many relatioship. Standard way to treat that is to make an intermediate MenuItems table that has one-to-many relationships with Menus and Items.
- Open LittleLemonDM.mwb then run forward engineering.
- Run LLDB_PopulateTables.sql to populate the tables. Some of the menus were composed by me with the help of DeepSeek (see TraditionalMenus.docx).
- Primary keys of some of my tables are auto-incremented. So for insert operations sometimes the IDs fields are omitted. The created store procedures may differ from the course's recommendation accordingly.
- In the Tableau workbook, I filtered out all the Sales that < 4820 instead of 70 as recommended. Otherwise, there are two many customers.
- Images for Tableau tasks are stored in the PNG_images folder.
- The credentials to access the database are read from the file db_credentials.txt, which was not pushed to the repository for security purposes. Assign your credentials to the two variables lldb_user and lldb_password to use in your local machine.

Note: .sql files are not grouped into a folder to avoid lost of Git tracking. .PNG images also left outside for easy access.
