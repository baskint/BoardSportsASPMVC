using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using BoardSports.DAL;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BoardSports.DAL.Windsurfing;

namespace BoardSports.Tests.Integration
{
    [TestClass]
    public class SailboardTests
    {
        [TestMethod]
        public void SaveBoard_Should_Return()
        {
            // arrange
            var board = new Board();

            board.BoardId = 2;
            board.BoardName = "Syncro";
            board.Manufacturer = "Mistral";
            board.Length = Convert.ToDecimal("240");
            board.Width = Convert.ToDecimal("65");
            board.Volume = 115;
            board.BoardType = "Windsurfing";
            board.PurchaseDate = Convert.ToDateTime("5/30/2006");
            board.PurchasePrice = 1499.95m;
            board.EstimatedValue = 600m;
            board.PurchaseLocation = "http://the-house.com";
            board.YearManufactured = 2006;
            board.PictureLocation = @"c:/abc/test.jpg";

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
