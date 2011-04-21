using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BoardSports.DAL.Windsurfing
{
    public class Sailboard
    {
        public bool SaveBoard(Board board)
        {
            bool retval = false;
            BoardSportsDevEntities be = new BoardSportsDevEntities();

            be.AddToBoards(board);

            try
            {
                be.SaveChanges();
                retval = true;
            }
            catch (Exception ex)

            {
                retval = false;
            }

            return retval;
        }
    }
}
