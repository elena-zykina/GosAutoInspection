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
    /// Логика взаимодействия для AddDriver.xaml
    /// </summary>
    public partial class AddDriver : Page
    {
        public AddDriver()
        {
            InitializeComponent();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Drivers driver = new Drivers()
                {
                    Name = TxtName.Text,
                    Surname = TxtSurname.Text,
                    MiddleName = TxtMiddleName.Text,


                };
                Transition.Context.Drivers.Add(driver);
                Transition.Context.SaveChanges();
                MessageBox.Show("Данные успешно добавлены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception er)
            {
                MessageBox.Show(er.Message.ToString());
            }
            Transition.MainFrame.GoBack();
        }
    }
}
