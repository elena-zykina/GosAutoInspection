using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using GosAutoInspection.DataBase;

namespace GosAutoInspection.Pages
{
    /// <summary>
    /// Логика взаимодействия для DriverList.xaml
    /// </summary>
    public partial class DriverList : Page
    {
        public DriverList()
        {
            InitializeComponent();
            DriversListView.ItemsSource = Transition.Context.Drivers.ToList();
        }

        private void EditBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            Transition.MainFrame.Navigate(new AddDriver());
        }

        private void DltBtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
