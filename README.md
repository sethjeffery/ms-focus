# MS Focus Shop

This app sets up a shop with products, special offers and delivery charges.
It provides a Ruby API and also a Rails JSON API.

## Ruby API

The `Basket` class provides a simple public API to add or remove line items,
and query the total charge.

```ruby
basket = Basket.new

basket.add('J01') # Alternatively: Basket.add('J01')
basket.add('B01')
basket.remove('J01')
 
basket.total
  => 2990

basket.formatted_total
  => "£29.90"

basket.line_items
  => [ ... ]
```

## Rails JSON API

You can do the same actions as above using a JSON API.

```
POST /api/basket/add.json { code: 'J01' }
POST /api/basket/add.json { code: 'B01' }
POST /api/basket/remove.json { code: 'J01' }

GET /api/basket.json
  => {
       total: 2990,
       formatted_total: '£29.90',
       items: [ ... ]
     }
```

## Thoughts for Improvement

- For the purpose of this exercise, the basket and its line items are global. In a real world scenario the LineItem class would be specific to a user or session.
- If offers conflict or have conditions, the system would need to be more intelligent to decide which one to pick.
- Perhaps there might be more criteria for offers, e.g. fixed discount, a range of products, get a free other product, etc.
- Given plenty more time, of course a single-page front end could also be created for the app.
- `Basket` can start to get large and might need extracting out some concerns, e.g. `setup` is not really a concern of the Basket, and the total calculations could be moved to a `Checkout` class.
