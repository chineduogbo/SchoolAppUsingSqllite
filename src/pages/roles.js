import Head from 'next/head';
import { Box, Container } from '@mui/material';
import { RolesList } from '../components/customer/roles-list';
import { CustomerListToolbar } from '../components/customer/customer-list-toolbar';
import { DashboardLayout } from '../components/dashboard-layout';


const Roles = (props) => (
  <>
    <Head>
      <title>
        Roles | School App
      </title>
    </Head>
    <Box
      component="main"
      sx={{
        flexGrow: 1,
        py: 8
      }}
    >
      <Container maxWidth={false}>
        <CustomerListToolbar />
        <Box sx={{ mt: 3 }}>
          <RolesList customers={props.response} />
        </Box>
      </Container>
    </Box>
  </>
);
Roles.getLayout = (page) => (
  <DashboardLayout>
    {page}
  </DashboardLayout>
);

export default Roles;



export async function getStaticProps() {
  // Get external data from the file system, API, DB, etc.

  const data = await fetch('http://localhost:3000/api/users/users');

  var response = await data.json();

  console.log(response);
  //const data = await fetch(URL + '/api/users/users')

  // The value of the `props` key will be
  //  passed to the `Home` component
  return {
    props: response
  }
}
