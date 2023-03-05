import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
// export async function addPizza() {
//   const pizza = await prisma.pizza.create({
//     data: {
//       personName: "name",
//       pizzaName: "pizzaname",
//       quantity: "quantity",
//       size: "size",
//     },
//   });
//   console.log(pizza);
// }

export