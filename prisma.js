import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
export async function addPizza() {
  const pizza = await prisma.order.create({
    data: {
      personName: "name",
      pizzaName: "pizzaname",
      quantity: "quantity",
      size: "size",
    },
  });
  console.log(pizza);
}
