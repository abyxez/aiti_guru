"""
Создаёт пример визуализированной SQL-схемы с помощью erdantic.
schema.png будет доступен в корне проекта.
"""

from typing import List, Optional

import erdantic as erd
from pydantic import BaseModel


class Category(BaseModel):
    id: int
    name: str
    parent: Optional[int] = None


class Product(BaseModel):
    id: int
    name: str
    quantity: int
    price: float
    category: Category


class Client(BaseModel):
    id: int
    name: str
    address: str


class CustomerOrder(BaseModel):
    id: int
    client: Client
    order_date: str
    order_items: List["OrderItem"]


class OrderItem(BaseModel):
    order: List[CustomerOrder]
    product: Product
    quantity: int


class DatabaseSchema(BaseModel):
    categories: List[Category]
    products: List[Product]
    clients: List[Client]
    orders: List[CustomerOrder]
    order_items: List[OrderItem]


erd.create(DatabaseSchema).draw("schema.png")
