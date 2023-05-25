using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserManagement.DTO
{
    public class ObjectDTO
    {
        private string nameObject;
        private string typeObject;
        public string NameObject { get => nameObject; set => nameObject = value; }
        public string TypeObject { get => typeObject; set => typeObject = value; }

        public ObjectDTO(string name, string type)
        {
            this.nameObject = name;
            this.typeObject = type;
        }

        public ObjectDTO(DataRow row)
        {
            this.nameObject = row["OBJECT_NAME"].ToString();
            this.typeObject = row["OBJECT_TYPE"].ToString();
        }
    }
}
