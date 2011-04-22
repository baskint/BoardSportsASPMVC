using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using BoardSports.DAL;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BoardSports.Tests.Integration
{
    [TestClass]
    public class SailboardTests
    {
        [TestMethod]
        public void SaveBoard_Should_Return()
        {
            // arrange
            var board = new Board
                            {
                                BoardId = 1,
                                BoardName = "Syncro",
                                Manufacturer = "Mistral",
                                Length = Convert.ToDecimal("240"),
                                Width = Convert.ToDecimal("65"),
                                Volume = 115,
                                BoardType = "Windsurfing",
                                PurchaseDate = Convert.ToDateTime("5/30/2006"),
                                PurchasePrice = 1499.95m,
                                EstimatedValue = 600m,
                                YearManufactured = 2006,
                                PictureLocation = @"c:/abc/test.jpg"
                            };

            var sb = new Sailboard();
            var retval = sb.SaveBoard(board);

            // assert
            Assert.IsTrue(retval);

        }

        [TestMethod]
        public void DeleteAllBoards_In_DBs()
        {
            
        }
    }
}
