using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BoardSports.DAL;

namespace BoardSports.DAL
{
    public class Sailboard
    {
        public bool SaveBoard(Board board)
        {

            bool retval = false;

            var be = new BoardSportsDevEntity();

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

        public Board GetBoard(int boardId)
        {
            var board = new Board();
            using (var context = new BoardSportsDevEntity())
            {
                var q = from b in context.Boards
                            where b.BoardId == boardId 
                            select b;

                if (q.Count() == 1)
                {
                  // assign the board to the object
                } 
            }
            return board;
        }
    }
}
