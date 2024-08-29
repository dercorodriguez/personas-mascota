import React, { useState } from 'react';
import { TextField, MenuItem, Button, Container, Typography, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Grid } from '@mui/material';

function Persona() {
    const [datos, setdatos] = useState({
        tipoidentificacion: '',
        identificacion: '',
        nombres: '',
        apellidos: '',
        fechanacimiento: '',
        estatura: '',
        nacionalidad: '',
        direccion: '',
        telefono: '',
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

    const datospersonas = [
        { tipoidentificacion: 'Cédula', identificacion: '0951572324', nombres: 'David', apellidos: 'García', fechanacimiento: '1990-01-01', estatura: '175', nacionalidad: 'Ecuatoriana', direccion: 'Av. Principal 123', telefono: '0987654321', estado: 'Activo' },
        { tipoidentificacion: 'Pasaporte', identificacion: '0911272324', nombres: 'Ana', apellidos: 'Martínez', fechanacimiento: '1985-06-15', estatura: '160', nacionalidad: 'Colombiana', direccion: 'Calle Secundaria 456', telefono: '0987654322', estado: 'Inactivo' }
    ];

    return (
        <Container style={{ padding: '20px' }}>
            <Typography variant="h4" gutterBottom>Agregar una Persona</Typography>
            <Grid container spacing={3}>
                <Grid item xs={12} md={3}>
                    <form onSubmit={enviar}>
                        <TextField
                            fullWidth
                            margin="normal"
                            id="tipoidentificacion"
                            select
                            label="Tipo de Identificación"
                            name="tipoidentificacion"
                            value={datos.tipoidentificacion}
                            onChange={guardarCambios}
                        >
                            <MenuItem value="">Selecciona una opción</MenuItem>
                            <MenuItem value="Cédula">Cédula</MenuItem>
                            <MenuItem value="Pasaporte">Pasaporte</MenuItem>
                        </TextField>
                        <TextField
                            fullWidth
                            margin="normal"
                            id="identificacion"
                            label="Identificación"
                            name="identificacion"
                            value={datos.identificacion}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="nombres"
                            label="Nombres"
                            name="nombres"
                            value={datos.nombres}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="apellidos"
                            label="Apellidos"
                            name="apellidos"
                            value={datos.apellidos}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="fechanacimiento"
                            type="date"
                            label="Fecha de Nacimiento"
                            name="fechanacimiento"
                            value={datos.fechanacimiento}
                            onChange={guardarCambios}
                            InputLabelProps={{ shrink: true }}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="estatura"
                            type="number"
                            label="Estatura (cm)"
                            name="estatura"
                            value={datos.estatura}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="nacionalidad"
                            label="Nacionalidad"
                            name="nacionalidad"
                            value={datos.nacionalidad}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="direccion"
                            label="Dirección"
                            name="direccion"
                            value={datos.direccion}
                            onChange={guardarCambios}
                        />
                        <TextField
                            fullWidth
                            margin="normal"
                            id="telefono"
                            label="Teléfono"
                            name="telefono"
                            value={datos.telefono}
                            onChange={guardarCambios}
                        />
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
                            <MenuItem value="">Selecciona un estado</MenuItem>
                            <MenuItem value="Activo">Activo</MenuItem>
                            <MenuItem value="Inactivo">Inactivo</MenuItem>
                        </TextField>
                        <Button
                            type="submit"
                            variant="contained"
                            color="primary"
                            style={{ marginTop: '10px' }}
                        >
                            Enviar
                        </Button>
                    </form>
                </Grid>
                <Grid item xs={12} md={9}>
                    <Paper style={{ padding: '20px' }}>
                        <Typography variant="h6" gutterBottom>Listado de Personas</Typography>
                        <TableContainer component={Paper}>
                            <Table>
                                <TableHead>
                                    <TableRow>
                                        <TableCell>Tipo de Identificación</TableCell>
                                        <TableCell>Identificación</TableCell>
                                        <TableCell>Nombres</TableCell>
                                        <TableCell>Apellidos</TableCell>
                                        <TableCell>Fecha de Nacimiento</TableCell>
                                        <TableCell>Estatura (cm)</TableCell>
                                        <TableCell>Nacionalidad</TableCell>
                                        <TableCell>Dirección</TableCell>
                                        <TableCell>Teléfono</TableCell>
                                        <TableCell>Estado</TableCell>
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                    {datospersonas.map((persona, index) => (
                                        <TableRow key={index}>
                                            <TableCell>{persona.tipoidentificacion}</TableCell>
                                            <TableCell>{persona.identificacion}</TableCell>
                                            <TableCell>{persona.nombres}</TableCell>
                                            <TableCell>{persona.apellidos}</TableCell>
                                            <TableCell>{persona.fechanacimiento}</TableCell>
                                            <TableCell>{persona.estatura}</TableCell>
                                            <TableCell>{persona.nacionalidad}</TableCell>
                                            <TableCell>{persona.direccion}</TableCell>
                                            <TableCell>{persona.telefono}</TableCell>
                                            <TableCell>{persona.estado}</TableCell>
                                        </TableRow>
                                    ))}
                                </TableBody>
                            </Table>
                        </TableContainer>
                    </Paper>
                </Grid>
            </Grid>
        </Container>
    );
}

export default Persona;
