using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UP01._01_Nechaeva.API
{
    internal class Connector
    {
        public Connector()
        {
        }
        public List<Advertisment> GetAddList()
        {
            return UpEntities.GetContext().Advertisment.ToList();
        }

        public List<Advertisment> GetSortedAddList(

            int City = -1,
            int Category = -1,
            string AdName = "",
            //string AdDescription = "",
            Users User = null
            )
        {

            var Adds = UpEntities.GetContext().Advertisment.ToList();
            if (Adds == null || Adds.Count() == 0) return null;



            if (City > -1)
            {
                Adds = Adds.Where(x => x.City == City).ToList();
            }

            if (Category > -1)
            {
                Adds = Adds.Where(x => x.Category == Category).ToList();
            }



            if (!string.IsNullOrEmpty(AdName))
            {
                Adds = Adds.Where(x => x.AdName.StartsWith(AdName)).ToList();
            }

            if (User != null)
            {
                Adds = Adds.Where(x => x.AdOwner == User.Id).ToList();
            }

            return Adds;
        }

        public List<City> GetCityList()
        {
            return UpEntities.GetContext().City.ToList();
        }

        public List<Category> GetCategoryList()
        {
            return UpEntities.GetContext().Category.ToList();
        }

        public Users GetUser(string Login, string Password)
        {
            try
            {
                Users user = UpEntities.GetContext().Users.ToList().Where(x => x.UserLogin == Login && x.UserPassword == Password).ToList().First();
                return user;
            }
            catch
            {
                return null;
            }
        }

    }
}