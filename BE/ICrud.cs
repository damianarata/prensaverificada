using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public interface ICrud <T>
    {
        bool Create(T objAlta);
        List<T> RetreiveAll();
        bool Update(T objUpd);
        bool Delete(T objDel);
    }
}
