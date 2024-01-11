import { faker } from '@faker-js/faker';
import Customer from './models/customerModel.js';

const customers = Array.from({ length: 30 }, () => ({
  dni: faker.string.uuid(),
  names:  faker.internet.userName(),
  last_names:  faker.internet.userName(),
  birthdate: faker.date.birthdate(),
  phone: faker.string.uuid(),
  email: faker.internet.email(),
  bank: faker.date.past(),
  cci_number: faker.string.uuid(),
  bonus_password: faker.internet.password(),
}));

const result = await Customer.bulkCreate(customers);
