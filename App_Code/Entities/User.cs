public class User
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Password { get; set; }
    public string Email { get; set; }
    public string Type { get; set; }

    public User(int id, string name, string password, string email, string type)
    {
        Id = id;
        Name = name;
        Password = password;
        Email = email;
        Type = type;
    }

    public User(string name, string password, string email, string type)
    {
        Name = name;
        Password = password;
        Email = email;
        Type = type;
    }
}