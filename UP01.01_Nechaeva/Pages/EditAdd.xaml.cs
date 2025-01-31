using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
    public partial class EditAdd : Page
    {
        Users CurrentUser;
        Advertisment CurrentAdd = null;
        Connector connector = new Connector();

        public EditAdd(Users User, Advertisment Add = null)
        {
            InitializeComponent();
            CurrentUser = User;
            if (Add == null)
            {
                btnSave.Content = "Создать";
                btnDelete.Visibility = Visibility.Hidden;
            }
            else
            {
                CurrentAdd = Add;
                btnDelete.Visibility = Visibility.Visible;
                btnSave.Content = "Обновить";


                cbCity.SelectedValue = CurrentAdd.City1;
                cbCategory.SelectedValue = CurrentAdd.Category1;
                ;
                tbName.Text = CurrentAdd.AdName;
                tbDescription.Text = CurrentAdd.AdDescription;

                tbPhoto.Text = CurrentAdd.Photo;
            }
            cbCategory.ItemsSource = connector.GetCategoryList();
            cbCity.ItemsSource = connector.GetCityList();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                UpEntities.GetContext().Advertisment.Remove(CurrentAdd);
                UpEntities.GetContext().SaveChanges();
                MessageBox.Show("Объявление успешно удалено");
                NavigationService.Navigate(new UserAdds(CurrentUser));
            }
            catch
            {
                MessageBox.Show("Произошла ошибка удаления");
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (
                cbCity.SelectedIndex == -1 &&
                cbCategory.SelectedIndex == -1 &&

                string.IsNullOrEmpty(tbName.Text) &&
                string.IsNullOrEmpty(tbDescription.Text)

                )
            {
                MessageBox.Show("Не все поля заполнены");

                return;
            }

            if (CurrentAdd == null) CurrentAdd = new Advertisment();

            CurrentAdd.AdDate = DateTime.Now;
            CurrentAdd.AdOwner = CurrentUser.Id;
            CurrentAdd.City = ((City)cbCity.SelectedValue).Id;
            CurrentAdd.Category = ((Category)cbCategory.SelectedValue).Id;
            CurrentAdd.AdName = tbName.Text;
            CurrentAdd.AdDescription = tbDescription.Text;
            CurrentAdd.Photo = tbPhoto.Text == "" ? null : tbPhoto.Text;

            try
            {
                UpEntities.GetContext().Advertisment.AddOrUpdate(CurrentAdd);
                UpEntities.GetContext().SaveChanges();
                MessageBox.Show("Объявление успешно добавлено/обновлено");
                NavigationService.Navigate(new UserAdds(CurrentUser));
            }
            catch
            {
                MessageBox.Show("Произошла ошибка добавления/обновления");
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new UserAdds(CurrentUser));
        }
    }
}