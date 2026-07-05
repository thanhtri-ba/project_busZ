import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { PrismaClient } from '@prisma/client';

dotenv.config();

const app = express();
const prisma = new PrismaClient();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('BusZ Backend API is running!');
});

// Example route to fetch trips with relations
app.get('/trips', async (req, res) => {
  try {
    const trips = await prisma.trip.findMany({
      include: {
        busAgent: true,
        route: {
          include: {
            departureCity: true,
            arrivalCity: true,
          }
        },
        schedules: true,
      }
    });
    res.json(trips);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch trips' });
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
