﻿ALTER TABLE [dbo].[Rigs]
    ADD CONSTRAINT [FK_Rigs_Venues] FOREIGN KEY ([VenueId]) REFERENCES [dbo].[Venues] ([VenueId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

