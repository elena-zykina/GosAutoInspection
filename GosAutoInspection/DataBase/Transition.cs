using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace GosAutoInspection.DataBase
{
    class Transition
    {
        public static Frame MainFrame { get; set; }

        private static GosAutoInspectionEntities context;
        public static GosAutoInspectionEntities Context
        {
            get
            {
                if (context == null)
                    context = new GosAutoInspectionEntities();

                return context;
            }
        }
    }
}
