import { PrismaClient } from "@prisma/client";
import { personName, pizzaName, quantity, size } from "./views/js/ordering.js";

const prisma = new PrismaClient();
export async function addPizza() {
  const pizza = await prisma.pizza.create({
    data: {
      personName: personName,
      pizzaName: pizzaName,
      quantity: quantity,
      size: size,
    },
  });
  console.log(pizza);
}
