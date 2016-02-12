using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de clsCitaPaginado
/// </summary>
public class clsCitaPaginado
{

    public List<clsCita> listCitas { get; set; }

    public clsCitaPaginado()
    {
        listCitas = new List<clsCita>();
    }
}