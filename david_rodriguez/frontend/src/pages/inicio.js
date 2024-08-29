import React from 'react';
import { Link } from 'react-router-dom';
import { Button, Container, Typography, Grid } from '@mui/material';

function Inicio() {
    return (
        <Container
            style={{
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'center',
                alignItems: 'center',
                height: '100vh'
            }}
        >
            <Typography
                variant="h4"
                gutterBottom
                style={{ marginBottom: '20px' }}
            >
                PRUEBA TÉCNICA
            </Typography>

            <Grid
                container
                spacing={2}
                justifyContent="center"
            >
                <Grid item>
                    <Link to="/persona" style={{ textDecoration: 'none' }}>
                        <Button
                            variant="contained"
                            color="primary"
                        >
                            Ir a Persona
                        </Button>
                    </Link>
                </Grid>
                <Grid item>
                    <Link to="/mascota" style={{ textDecoration: 'none' }}>
                        <Button
                            variant="contained"
                            color="secondary"
                        >
                            Ir a Mascota
                        </Button>
                    </Link>
                </Grid>
            </Grid>
        </Container>
    );
}

export default Inicio;
