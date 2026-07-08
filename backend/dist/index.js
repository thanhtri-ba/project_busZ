"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
const client_1 = require("@prisma/client");
dotenv_1.default.config();
const app = (0, express_1.default)();
const prisma = new client_1.PrismaClient();
const port = process.env.PORT || 3000;
app.use((0, cors_1.default)());
app.use(express_1.default.json());
const ai_routes_1 = __importDefault(require("./modules/ai/ai.routes"));
app.use('/api/ai', ai_routes_1.default);
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
    }
    catch (error) {
        res.status(500).json({ error: 'Failed to fetch trips' });
    }
});
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
