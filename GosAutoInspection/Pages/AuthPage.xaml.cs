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
using GosAutoInspection.Pages;

namespace GosAutoInspection
{
    /// <summary>
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        List<Authorization> auth = Transition.Context.Authorization.ToList();
        public AuthPage()
        {
            InitializeComponent();
        }

        private void AuthBtn_Click(object sender, RoutedEventArgs e)
        {
            foreach (var user in auth)
            {
                if (LoginTxtb.Text == user.Login.ToString() || PasswordTxtb.Text.ToString() == user.Password.ToString())
                {
                    Transition.MainFrame.Navigate(new DriverList());
                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль");
                }
            }
        }
    }
}
