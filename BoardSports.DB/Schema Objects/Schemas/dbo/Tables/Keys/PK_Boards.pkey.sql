﻿ALTER TABLE [dbo].[Boards]
    ADD CONSTRAINT [PK_Boards] PRIMARY KEY CLUSTERED ([BoardId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
