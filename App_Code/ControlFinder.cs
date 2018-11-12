using System.Collections.Generic;
using System.Web.UI;

public class ControlFinder<T> where T : Control
{
	private readonly List<T> foundControls = new List<T>();

    public IEnumerable<T> FoundControls
    {
        get { return foundControls; }
    }

    public void FindChildControlsRecursive(Control control)
    {
        foreach (Control childControl in control.Controls)
        {
            if(childControl.GetType() == typeof(T))
                foundControls.Add((T) childControl);
            else
            {
                FindChildControlsRecursive(childControl);
            }
        }
    }
}