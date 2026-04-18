setting up repsitory for project

Copyright to @Thai Giang Dang 28 February 2025 GitTurtleDone.github

## How to use this repository:

- In MySQL Workbench, open and run the script: [LittleLemonDB250228.sql](https://github.com/GitTurtleDone/db-capstone-project/blob/main/LittleLemonDB250228.sql). The database with all data, views, stored procedures will be created, which are shown in the image: [LLDBwithTablesNProceduresNViews.png](https://github.com/GitTurtleDone/db-capstone-project/blob/main/LLDBwithTablesNProceduresNViews.png). The ER diagram is shown in the image: [LittleLemonDM.png](https://github.com/GitTurtleDone/db-capstone-project/blob/main/LittleLemonDM.png).
- Open the jupyter notebook: [Module3_tasks2_AddQueryFunctions.ipynb](https://github.com/GitTurtleDone/db-capstone-project/blob/main/Module3_tasks2_AddQueryFunctions.ipynb)
- The credentials to access the database are read from the file db_credentials.txt, which was not pushed to the repository for security purposes. In the first cell of this notebook, assign your credentials to the two variables lldb_user and lldb_password to use in your local machine.
- Run the susequent cells.
- If everything is set up correctly, you will see that the GetMaxQuantity, ManageBooking, AddBooking, UpdateBooking, and Cancel Booking procedures work correctly as indicated in the corresponding results. The store procedures ared called using the defined CallStoredProcedure. Sample codes are also provided.

## Some notes if you are curious:

- The treatment of the MenuItems table in the course was not correct. The MenuItems table should be an intermediate between two tables Menus and Items. Menus and Items are connected by a many-to-many relatioship. A standard way to treat that is to make an intermediate MenuItems table that has one-to-many relationships with Menus and Items.
- In the Tableau workbook, I filtered out all the Sales that < 4820 instead of 70 as recommended. Otherwise, there are two many customers.
- .sql files are not grouped into a folder to avoid lost of Git tracking. .PNG images also left outside for easy access.
