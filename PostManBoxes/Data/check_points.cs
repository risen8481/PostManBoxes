//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PostManBoxes.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class check_points
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public check_points()
        {
            this.boxes = new HashSet<boxes>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public decimal latitude { get; set; }
        public decimal longitude { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<boxes> boxes { get; set; }
    }
}