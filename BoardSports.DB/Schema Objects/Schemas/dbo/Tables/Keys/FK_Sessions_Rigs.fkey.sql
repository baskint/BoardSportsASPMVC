﻿ALTER TABLE [dbo].[Sessions]
    ADD CONSTRAINT [FK_Sessions_Rigs] FOREIGN KEY ([RigId]) REFERENCES [dbo].[Rigs] ([RigId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

