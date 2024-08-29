import React, { useState } from 'react';
import { TextField, MenuItem, Button, Container, Typography, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Grid } from '@mui/material';

function Mascota() {
    const [datos, setdatos] = useState({
        id_especie: '',
        id_raza: '',
        color: '',
        nombre: '',
        publicar: '',
        estado: ''
    });

    const guardarCambios = (e) => {
        const { name, value } = e.target;
        setdatos({ ...datos, [name]: value });
    };

    const enviar = (e) => {
        e.preventDefault();
        console.log(datos);
    };

    const datosmascotas = [
        { id_especie: 'Canino', id_raza: 'Labrador', color: 'Negro', nombre: 'Rex', publicar: 'Sí', estado: 'Activo' },
        { id_especie: 'Felino', id_raza: 'Siames', color: 'Blanco', nombre: 'Mittens', publicar: 'No', estado: 'Inactivo' }
    ];

    return (
        <Container>
            <Typography variant="h4" gutterBottom>Agregar una Mascota</Typography>
            <Grid container spacing={3}>
                <Grid item xs={12} md={3}>
                    <form onSubmit={enviar}>
                        <TextField
                            fullWidth
                            margin="normal"
                            id="id_especie"
                            label="Especie"
                            name="id_especie"
                            value={datos.id_especie}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="id_raza"
                            label="Raza"
                            name="id_raza"
                            value={datos.id_raza}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="color"
                            label="Color"
                            name="color"
                            value={datos.color}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="nombre"
                            label="Nombre"
                            name="nombre"
                            value={datos.nombre}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="publicar"
                            select
                            label="Publicar"
                            name="publicar"
                            value={datos.publicar}
                            onChange={guardarCambios}
                        >
                            <MenuItem value="1">Sí</MenuItem>
                            <MenuItem value="0">No</MenuItem>
                        </TextField>
                        <TextField
                            fullWidth
                            margin="normal"
                            id="estado"
                            select
                            label="Estado"
                            name="estado"
                            value={datos.estado}
                            onChange={guardarCambios}
                        >
                            <MenuItem value="1">Activo</MenuItem>
                            <MenuItem value="0">Inactivo</MenuItem>
                        </TextField>
                        <Button
                            type="submit"
                            variant="contained"
                            color="primary"
                        >
                            Enviar
                        </Button>
                    </form>
                </Grid>
                <Grid item xs={12} md={9}>
                    <Typography variant="h6" gutterBottom>Listado de Mascotas</Typography>
                    <TableContainer component={Paper}>
                        <Table>
                            <TableHead>
                                <TableRow>
                                    <TableCell>Especie</TableCell>
                                    <TableCell>Raza</TableCell>
                                    <TableCell>Color</TableCell>
                                    <TableCell>Nombre</TableCell>
                                    <TableCell>Publicar</TableCell>
                                    <TableCell>Estado</TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {datosmascotas.map((row, index) => (
                                    <TableRow key={index}>
                                        <TableCell>{row.id_especie}</TableCell>
                                        <TableCell>{row.id_raza}</TableCell>
                                        <TableCell>{row.color}</TableCell>
                                        <TableCell>{row.nombre}</TableCell>
                                        <TableCell>{row.publicar}</TableCell>
                                        <TableCell>{row.estado}</TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </TableContainer>
                </Grid>
            </Grid>
        </Container>
    );
}

export default Mascota;
