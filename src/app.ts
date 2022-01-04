import express, { Errback, NextFunction, Request, Response } from 'express';

import router from './routes';

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(router);

app.use((req: Request, res: Response, _next: NextFunction) => {
  res.status(404).json({ message: 'Page Not Found' });
});

app.use((err: Errback, req: Request, res: Response, _next: NextFunction) => {
  return res.status(500).json({ message: 'Internal Error' });
});

export default app;
