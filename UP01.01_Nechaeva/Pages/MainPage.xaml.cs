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
using UP01._01_Nechaeva.API;

namespace UP01._01_Nechaeva.Pages
{
    public partial class MainPage : Page
    {
        Connector connector = new Connector();
        Users CurrentUser = null;
        public MainPage() : this(null)
        {
        }
        public MainPage(Users user = null)
        {
            InitializeComponent();

            lvAdds.ItemsSource = connector.GetAddList();
            cbCategory.ItemsSource = connector.GetCategoryList();
            cbCity.ItemsSource = connector.GetCityList();
            if (user != null)
            {
                CurrentUser = user;
                btnAuth.Content = $"{user.UserName} (перезайти)";
                btnMyAdds.IsEnabled = true;
            }
        }
        private void cbCity_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
        private void cbCategory_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
        private void tbName_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }
        public void Update()
        {
            int City = cbCity.SelectedIndex == -1 ? -1 : ((UP01._01_Nechaeva.API.City)cbCity.SelectedValue).Id;
            int Category = cbCategory.SelectedIndex == -1 ? -1 : ((UP01._01_Nechaeva.API.Category)cbCategory.SelectedValue).Id;
            string Name = string.IsNullOrEmpty(tbName.Text) ? "" : tbName.Text;
            lvAdds.ItemsSource = connector.GetSortedAddList(City, Category, Name);
        }
        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            lvAdds.ItemsSource = connector.GetAddList();
            cbCategory.SelectedItem = null;
            cbCity.SelectedItem = null;
            tbName.Text = "";
        }
        private void btnAuth_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AuthPage());
        }
        private void btnMyAdds_Click(object sender, RoutedEventArgs e)
        {
            if (CurrentUser == null)
            {
                MessageBox.Show("Вы не авторизованы!");
            }
            else
            {
                NavigationService.Navigate(new UserAdds(CurrentUser));
            }
        }
    }
}