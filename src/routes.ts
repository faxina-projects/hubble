import { Router } from 'express';

const router = Router();

router.get('/', (req, res) => {
  res.json('Not protected endpoint');
});

router.get('/protected', (req, res) => {
  res.json(
    `Hello ${req.header(
      'ssl_client',
    )}, your certificate was issued by ${req.header('SSL_Client_Issuer')}!`,
  );
});

export default router;
