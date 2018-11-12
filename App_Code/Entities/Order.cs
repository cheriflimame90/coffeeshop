using System;

namespace Entities
{
    public class Order
    {
        public int Id { get; set; }
        public string Client { get; set; }
        public string Product { get; set; }
        public int Amount { get; set; }
        public double Price { get; set; }
        public DateTime Date { get; set; }
        public bool OrderShipped { get; set; }

        public Order(int id, string client, string product, int amount, double price, DateTime date, bool orderShipped)
        {
            Id = id;
            Client = client;
            Product = product;
            Amount = amount;
            Price = price;
            Date = date;
            OrderShipped = orderShipped;
        }

        public Order(string client, string product, int amount, double price, DateTime date, bool orderShipped)
        {
            Client = client;
            Product = product;
            Amount = amount;
            Price = price;
            Date = date;
            OrderShipped = orderShipped;
        }
    }
}