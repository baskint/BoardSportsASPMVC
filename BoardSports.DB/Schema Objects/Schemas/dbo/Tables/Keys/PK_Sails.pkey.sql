﻿ALTER TABLE [dbo].[Sails]
    ADD CONSTRAINT [PK_Sails] PRIMARY KEY CLUSTERED ([SailId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
