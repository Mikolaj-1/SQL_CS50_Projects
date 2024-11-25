CREATE TABLE "ingredients" (
    "name" TEXT,
    "unit" TEXT,
    "amount" INTEGER,
    "price" REAL
);

CREATE TABLE "donuts" (
    "name" TEXT,
    "gluten-free" TEXT CHECK("gluten-free" IN ("yes","no")),
    "price" TEXT,
    "ingredients" TEXT,
    FOREIGN KEY ("ingredients") REFERENCES "ingredients"("name")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "order_number" INTEGER,
    "donuts_ordered" TEXT,
    "customer" TEXT,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("customer") REFERENCES "customers"("name")
);

CREATE TABLE "customers" (
    "name" TEXT,
    "history" TEXT
);
